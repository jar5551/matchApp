using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Matching2.Models.DB;
namespace Matching2.Models
{
    public class UserModel
    {

        public string Email { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public bool Sex { get; set; }

        public string Description { get; set; }

        public DateTime CreateDate { get; set; }

        public string Password { get; set; }

        public string RePassword { get; set; }


        #region static methods

        private static MatchingEntities dataContext = new MatchingEntities();
        public static List<User> GetAllUsers()
        {
            var query = from user in dataContext.Users
                        select user;
            return query.ToList();
        }

        public static List<User> SearchUserBySecondName(string userSecondName)
        {
            var query = from user in dataContext.Users
                        where user.lastName.Contains(userSecondName)
                        select user;
            return query.ToList();
        }

        public static User GetUserByID(int userID)
        {
            var query = from user in dataContext.Users
                        where user.id == userID
                        select user;
            return query.SingleOrDefault();
        }

        public static List<User> InsertUser(User user)
        {
            dataContext.Users.Add(user);
            dataContext.SaveChanges();
            return GetAllUsers();
        }

        public static List<User> UpdateUser(User user)
        {
            var user1 = (from u in dataContext.Users
                         where user.id == u.id
                         select u).SingleOrDefault();

            user1.email = user.email;
            user1.firstName = user.firstName;
            user1.lastName = user.lastName;
            user1.sex = user.sex;
            user1.description = user.description;
            user1.createdDate = user.createdDate;
            user1.password = user.password;
            user1.modifiedDate = DateTime.Now;

            dataContext.SaveChanges();
            return GetAllUsers();
        }

        public static List<User> Delete(User user)
        {
            var user1 = (from u in dataContext.Users
                         where user.id == u.id
                         select u).SingleOrDefault();

            dataContext.Users.Remove(user1);
            dataContext.SaveChanges();
            return GetAllUsers();
        }

        #endregion
    }
}