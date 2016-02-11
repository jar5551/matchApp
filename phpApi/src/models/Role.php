<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 30.12.2015
 * Time: 00:35
 */

namespace src\models;

use Illuminate\Database\Capsule\Manager as Capsule;

class Role
{
    public function getRoles($token)
    {

        $user = new User();
        if (!$user->isUserHasRole($token, 'update:all:permissions')) {
            throw new \Exception("Brak uprawnień");
        }

        $array = array();

        try {
            $ranks = Capsule::table('ranks')
                ->select('*')
                ->get();

            foreach ($ranks as $rank) {
                $roles = Capsule::table('rolestoranks as rtr')
                    ->select('rtr.id', 'rtr.role_id', 'r.role')
                    ->join('roles as r', 'rtr.role_id', '=', 'r.id')
                    ->where('rtr.rank_id', $rank->id)
                    ->get();

                $rank->roles = $roles;

                array_push($array, $rank);


            }
        } catch (\Exception $e) {
            throw new \Exception("Problem z uzyskaniem informacji o rangach");
        }

        return $array;
    }

    public function getRole($token, $id)
    {
        $user = new User();
        if (!$user->isUserHasRole($token, 'update:all:permissions')) {
            throw new \Exception("Brak uprawnień");
        }
        try {
            $rank = Capsule::table('ranks')
                ->select('*')
                ->where('id', $id)
                ->first();


            $roles = Capsule::table('rolestoranks as rtr')
                ->select('rtr.role_id', 'r.role')
                ->join('roles as r', 'rtr.role_id', '=', 'r.id')
                ->where('rtr.rank_id', $rank->id)
                ->get();

            $rank->roles = $roles;

        } catch (\Exception $e) {
            throw new \Exception("Problem z uzyskaniem informacji o rangach");
        }

        return $rank;

    }

    public function getAllPermissions($token) {
        $user = new User();

        if (!$user->isUserHasRole($token, 'update:all:permissions')) {
            throw new \Exception("Brak uprawnień");
        }

        try {

            $roles = Capsule::table('roles')
                ->select('*')
                ->get();


        } catch (\Exception $e) {
            throw new \Exception("Problem z uzyskaniem informacji o rangach");
        }

        return $roles;
    }

    public function updateRole($token, $id, $data) {
        $user = new User();
        if (!$user->isUserHasRole($token, 'update:all:permissions')) {
            throw new \Exception("Brak uprawnień");
        }

        $insert = array();
        $rankId = $data['id'];

        foreach($data['roles'] as $role) {
            array_push($insert, array('role_id' => $role['role_id'], 'rank_id' => $rankId));
        }
        try {
            Capsule::table('ranks')
                ->where('id', $data['id'])
                ->update(['name' => $data['name']]);

            Capsule::table('rolestoranks')
                ->where('rank_id', $rankId)
                ->delete();

            Capsule::table('rolestoranks')
                ->insert($insert);



        } catch (\Exception $e) {
            throw new \Exception("Problem z uzyskaniem informacji o rangach");
        }

        return true;

    }

    public function addRole($token, $data) {
        $user = new User();
        if (!$user->isUserHasRole($token, 'update:all:permissions')) {
            throw new \Exception("Brak uprawnień");
        }

        $insert = array();


        try {
            $rankId = Capsule::table('ranks')
                ->insertGetId(['name' => $data['name']]);

            foreach($data['roles'] as $role) {
                array_push($insert, array('role_id' => $role['role_id'], 'rank_id' => $rankId));
            }

            Capsule::table('rolestoranks')
                ->insert($insert);


        } catch (\Exception $e) {
            throw new \Exception("Problem z uzyskaniem informacji o rangach");
        }

        return true;
    }

    public function removeRole($token, $rankId) {
        $user = new User();
        if (!$user->isUserHasRole($token, 'update:all:permissions')) {
            throw new \Exception("Brak uprawnień");
        }



        try {
            Capsule::table('rolestoranks')
                ->where('rank_id', $rankId)
                ->delete();

            Capsule::table('ranks')
                ->where('id', $rankId)
                ->delete();


        } catch (\Exception $e) {
            throw new \Exception("Problem z uzyskaniem informacji o rangach");
        }

        return true;
    }
}