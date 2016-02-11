using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

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
    }
}