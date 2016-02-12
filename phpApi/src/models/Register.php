<?php
/**
 * Created by PhpStorm.
 * User: jarek
 * Date: 25.12.2015
 * Time: 18:22
 */

namespace src\models;

use Illuminate\Database\Capsule\Manager as Capsule;

class Register
{
    public function getRegisters($token)
    {
        $user = new User();
        $array = array();
        if (!$user->isUserHasRole($token, 'view:all:register')) {
            throw new \Exception("Brak uprawnień");
        }

        try {
            $documents = Capsule::table('registers')
                ->select('registers.id', 'registers.typeOfRegister', 'registers.code', 'registers.name', 'registers.description', 'units.id as unit_id', 'units.name as unitName', 'units.unitType')
                ->join('units', 'registers.unit_id', '=', 'units.id')
                ->get();

            foreach($documents as $document) {
                if($this->isRegisterBlanked($document->id)){
                    $document->blanked = true;
                } else {
                    $document->blanked = false;
                }
                array_push($array, $document);
            }

            return $array;

        } catch (\Exception $e) {
            throw new \Exception('Problem z probraniem dokumentów');
        }

        return false;
    }

    public function getSellBuyRegisters($token, $type)
    {
        $user = new User();

        if (!$user->isUserHasRole($token, 'view:all:register')) {
            if (!$user->isUserHasRole($token, 'view:my:register')) {
                throw new \Exception("Brak uprawnień");
            }
        }

        $meId = $user->getMeId($token);
        $myUnitsIds = $user->getUserUnits($meId);
        $unitsIdsArray = array();

        foreach ($myUnitsIds as $unit) {
            array_push($unitsIdsArray, $unit->id);
        }

        try {
            $registers = Capsule::table('registers as r')
                ->select('r.id', 'r.typeOfRegister', 'r.code', 'r.name', 'u.name as unitName', 'u.id as unit_id', 'u.unitType')
                ->join('units as u', 'r.unit_id', '=', 'u.id')
                ->whereIn('r.unit_id', $unitsIdsArray)
                ->where('r.typeOfRegister', $type)
                ->get();
        } catch (\Exception $e) {
            throw new \Exception('Problem z probraniem rejestrów');
        }

        $array = array();

        foreach($registers as $register) {
            if($this->isRegisterBlanked($register->id)){
                $register->blanked = true;
            } else {
                $register->blanked = false;
            }
            array_push($array, $register);
        }

        return $array;
    }

    public function getRegister($token, $id)
    {
        $user = new User();
        $unitsIdsArray = array();

        $query = Capsule::table('registers');

        if (!$user->isUserHasRole($token, 'view:all:register')) {
            if (!$user->isUserHasRole($token, 'view:my:register')) {
                throw new \Exception("Brak uprawnień");
            } else {
                $meId = $user->getMeId($token);
                $myUnitsIds = $user->getUserUnits($meId);


                foreach ($myUnitsIds as $unit) {
                    array_push($unitsIdsArray, $unit->id);
                }

                $query->whereIn('registers.unit_id', $unitsIdsArray);
            }
        }

        try {

            $query->select('registers.id', 'registers.typeOfRegister', 'registers.code', 'registers.name', 'registers.description', 'units.id as unit_id', 'units.name as unitName', 'registers.dateFrom', 'registers.dateTo', 'registers.disabled')
                ->join('units', 'registers.unit_id', '=', 'units.id')
                ->where('registers.id', $id);


            $documents = $query->first();

            $registerspositions = Capsule::table('registerspositions as rp')
                //->select('id', 'dateIssue', 'invoiceNumber', 'contractorNIP', 'contractorName')
                //->select(DB::raw('count(*) as user_count, status'))
                ->select(Capsule::raw('rp.id as id, rp.dateIssue, rp.invoiceNumber, rp.contractorNIP, rp.contractorName, ROUND(SUM(rpv.netto),2) totalNetto, ROUND(SUM(rpv.netto * IF(rpv.tax=-1,0,rpv.tax) / 100),2) as totalVat, ROUND(SUM(rpv.netto * IF(rpv.tax=-1,0,rpv.tax) / 100 + netto),2) as totalBrutto, rp.year, rp.month, rp.position'))
                ->leftJoin('registerspositionsvalues as rpv', 'rp.id', '=', 'rpv.registerId')
                ->where('rp.register_id', $id)
                ->groupBy('rp.id')
                ->orderBy('position', 'asc')
                ->orderBy('id', 'asc')
                ->get();



            $dateNow = date("Y-m-d");


            if (($documents->dateFrom != null && $documents->dateFrom > $dateNow) || ($documents->dateTo != null && $documents->dateTo < $dateNow) || $documents->disabled) {
                $documents->blanked = true;
            } else {
                $documents->blanked = false;
            }

            $documents->positions = $registerspositions;

            return $documents;

        } catch (\Exception $e) {
            throw new \Exception('Problem z probraniem dokumentów');
        }

        return false;
    }

    private function getNumberOfRegisterDocuments($registerId)
    {
        try {
            $numberOfDocuments = Capsule::table('registerspositions')
                ->where('register_id', $registerId)
                ->count();
        } catch (\Exception $e) {
            throw new \Exception('Problem z pobraniem informacji o rejestrach');
        }

        return $numberOfDocuments;
    }

    private function isRegisterByCodeInUnit($code, $unitId, $typeOfRegister)
    {
        try {
            $regisers = Capsule::table('registers')
                ->select('*')
                ->where('code', $code)
                ->where('unit_id', $unitId)
                ->where('typeOfRegister', $typeOfRegister)
                ->count();
        } catch (\Exception $e) {
            throw new \Exception('Problem z pobraniem informacji o rejestrach');
        }

        if ($regisers > 0) {
            return true;
        }

        return false;
    }

    private function getRegisterUnitId($registerId)
    {
        try {
            $unitId = Capsule::table('registers')
                ->select('unit_id as id')
                ->where('id', $registerId)
                ->first();
        } catch (\Exception $e) {
            throw new \Exception('Problem z pobraniem informacji o rejestrach');
        }

        return $unitId->id;
    }

    public function addRegister($token, $data)
    {
        $user = new User();

        if (!$user->isUserHasRole($token, 'add:all:register')) {
            if (!$user->isUserHasRole($token, 'add:my:register')) {
                throw new \Exception("Brak uprawnień");
            } else {
                if (!$user->isUserBelongsToUnit($user->getMeId($token), $data['unit_id'])) {
                    throw new \Exception("Brak uprawnień");
                }
            }
        }
        if (!isset($data['code']) || empty($data['code'])) {
            throw new \Exception("Podaj kod rejestru");
        }
        if (!isset($data['unit_id']) || empty($data['unit_id'])) {
            throw new \Exception("Podaj jednostkę do której ma być przypisany rejestr");
        }
        if (!isset($data['name']) || empty($data['name'])) {
            throw new \Exception("Podaj nazwę rejestru");
        }
        if ($this->isRegisterByCodeInUnit($data['code'], $data['unit_id'], $data['typeOfRegister'])) {
            throw new \Exception("Istnieje już rejestr o takim kodzie");
        }

        $array = array();
        $array['typeOfRegister'] = $data['typeOfRegister'];
        $array['code'] = $data['code'];
        $array['unit_id'] = $data['unit_id'];
        $array['name'] = $data['name'];
        $array['created'] = date("Y-m-d H:i:s");
        $array['userCreated'] = $user->getMeId($token);

        if (isset($data['dateFrom']) && !empty($data['dateFrom'])) {
            $array['dateFrom'] = $data['dateFrom'];
        }

        if (isset($data['dateTo']) && !empty($data['dateTo'])) {
            $array['dateTo'] = $data['dateTo'];
        }

        $array['disabled'] = false;

        try {
            Capsule::table('registers')
                ->insert($array);

        } catch (\Exception $e) {
            throw new \Exception('Problem z dodaniem rejestru');
        }

        return true;
    }

    public function updateRegister($token, $id, $data)
    {
        $user = new User();

        if (!$user->isUserHasRole($token, 'update:all:register')) {
            if (!$user->isUserHasRole($token, 'update:my:register')) {
                throw new \Exception("Brak uprawnień");
            } else {
                if (!$user->isUserBelongsToUnit($user->getMeId($token), $data['unit_id'])) {
                    throw new \Exception("Brak uprawnień");
                }
            }
        }

        $array = array();

        $array['code'] = $data['code'];

        $array['unit_id'] = $data['unit_id'];

        $array['name'] = $data['name'];

        $array['disabled'] = $data['disabled'];

        if (empty($data['dateFrom'])) {
            $array['dateFrom'] = null;
        } else {
            $array['dateFrom'] = $data['dateFrom'];
        }

        if (empty($data['dateTo'])) {
            $array['dateTo'] = null;
        } else {
            $array['dateTo'] = $data['dateTo'];
        }

        $array['typeOfRegister'] = $data['typeOfRegister'];
        $array['modified'] = date("Y-m-d H:i:s");
        $array['userModified'] = $user->getMeId($token);

        try {
            Capsule::table('registers')
                ->where('id', $id)
                ->update($array);

        } catch (\Exception $e) {
            throw new \Exception('Problem z dodaniem rejestru');
        }

        return true;
    }

    public function deleteRegister($token, $id)
    {
        $user = new User();

        if ($this->getNumberOfRegisterDocuments($id) > 0) {
            throw new \Exception("Nie można usunąć rejestru, gdyż znajdują się w nim wprowadzone dokumenty.");
        }

        if (!$user->isUserHasRole($token, 'delete:all:register')) {
            if (!$user->isUserHasRole($token, 'delete:my:register')) {
                throw new \Exception("Brak uprawnień");

            } else {
                if (!$user->isUserBelongsToUnit($user->getMeId($token), $this->getRegisterUnitId($id))) {
                    throw new \Exception("Brak uprawnień");
                }
            }
        }

        try {
            Capsule::table('registers')
                ->where('id', $id)
                ->delete();

        } catch (\Exception $e) {
            throw new \Exception('Problem z usunięciem rejestru');
        }

        return true;
    }

    private function isRegisterBlanked($registerId) {
        $documents = Capsule::table('registers')->select('dateFrom', 'dateTo', 'disabled')
            ->where('registers.id', $registerId)
            ->first();

        $dateNow = date("Y-m-d");

        if (($documents->dateFrom != null && $documents->dateFrom > $dateNow) || ($documents->dateTo != null && $documents->dateTo < $dateNow) || $documents->disabled) {
            return true;
        }

        return false;
    }
}