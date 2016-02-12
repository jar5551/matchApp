using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Matching2.Models.DB;
using Matching2.Models;
namespace Matching2.Controllers
{
    
    public class UserController : ApiController
    {
                 
            // GET api/user
            [Route("api/user")]
            public HttpResponseMessage Get()
            {
                var users = UserModel.GetAllUsers();
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, users);
                return response;
            }

            // GET api/user/5
            [Route("api/user/{id?}")]
            public HttpResponseMessage Get(int id)
            {
                var user = UserModel.GetUserByID(id);
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, user);
                return response;
            }

            [Route("api/user/{name:alpha}")]
            public HttpResponseMessage Get(string name)
            {
                var users = UserModel.SearchUserBySecondName(name);
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, users);
                return response;
            }

            [Route("api/user")]
            public HttpResponseMessage Post(User user)
            {
                var users = UserModel.InsertUser(user);
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, users);
                return response;
            }

            [Route("api/user")]
            public HttpResponseMessage Put(User user)
            {
                var users = UserModel.UpdateUser(user);
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, users);
                return response;
            }

            [Route("api/user")]
            public HttpResponseMessage Delete(User user)
            {
                var  users = UserModel.Delete(user);
                HttpResponseMessage response = Request.CreateResponse(HttpStatusCode.OK, users);
                return response;
            }
        

    }
}
