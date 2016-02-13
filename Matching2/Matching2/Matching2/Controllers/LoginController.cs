using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Description;
using Matching2.Models.DB;
using JWT;
using System.Security.Cryptography;
using System.Text;
using Matching2.Models;

namespace Matching2.Controllers
{
    public class LoginController : ApiController
    {
        private MatchingEntities db = new MatchingEntities();


        [AllowAnonymous]
        [Route("signup")]
        [HttpPost]
        public HttpResponseMessage Register(UserModel userModel)
        {
            String email = userModel.Email;
            String password = userModel.Password;
            
            HttpResponseMessage response;
            if (ModelState.IsValid)
            {
                var existingUser = db.Users.FirstOrDefault(u => u.email == userModel.Email);
                if (existingUser != null)
                {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "User already exist.");
                }

                if(!userModel.Password.Equals(userModel.RePassword)) {
                    return Request.CreateResponse(HttpStatusCode.BadRequest, "Passwords are not the same.");
                }

                //Create user and save to database
                var user = CreateUser(userModel);

                object dbUser;

                //Create token
                var token = CreateToken(user, out dbUser);

                response = Request.CreateResponse(new { dbUser, token });
            }
            else
            {
                response = Request.CreateResponse(HttpStatusCode.BadRequest, new { success = false });
            }

            return response;
        }

        private User CreateUser(UserModel userModel)
        {
            var user = new User();
            user.email = userModel.Email;
            user.password = EncryptPassword(userModel.Password);
            user.lastName = userModel.LastName;
            user.firstName = userModel.FirstName;
            user.createdDate = DateTime.Now;
            user.description = userModel.Description;
            user.sex = userModel.Sex;

            db.Users.Add(user);
            db.SaveChanges();

            return user;
        }

        public static string EncryptPassword(string password)
        {
            using (var sha256 = SHA256.Create())
            { 
                var passwordAsBytes = Encoding.UTF8.GetBytes(password);
                return Convert.ToBase64String(sha256.ComputeHash(passwordAsBytes));
            }
        }

        private static string CreateToken(User user, out object dbUser)
        {
            // Token expired after 2 hours
            var expiry = DateTime.UtcNow.AddHours(2);


            var payload = new Dictionary<string, object>
            {
                {"email", user.email},
                {"userId", user.id},
                {"role", "Admin"  },
                {"exp", expiry}
            };


            const string apikey = "secretKey";

            var token = JsonWebToken.Encode(payload, apikey, JwtHashAlgorithm.HS256);

            dbUser = new { user.email, user.id };
            return token;
        }

        // GET: api/Login
        public IQueryable<User> GetUsers()
        {
            return db.Users;
        }

        // GET: api/Login/5
        [ResponseType(typeof(User))]
        public IHttpActionResult GetUser(int id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return NotFound();
            }

            return Ok(user);
        }

        // PUT: api/Login/5
        [ResponseType(typeof(void))]
        public IHttpActionResult PutUser(int id, User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != user.id)
            {
                return BadRequest();
            }

            db.Entry(user).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!UserExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Login
        [HttpPost]
        [AllowAnonymous]
        [ResponseType(typeof(User))]
        public IHttpActionResult PostUser(User user)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Users.Add(user);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = user.id }, user);
        }

        // DELETE: api/Login/5
        [ResponseType(typeof(User))]
        public IHttpActionResult DeleteUser(int id)
        {
            User user = db.Users.Find(id);
            if (user == null)
            {
                return NotFound();
            }

            db.Users.Remove(user);
            db.SaveChanges();

            return Ok(user);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UserExists(int id)
        {
            return db.Users.Count(e => e.id == id) > 0;
        }
    }
}