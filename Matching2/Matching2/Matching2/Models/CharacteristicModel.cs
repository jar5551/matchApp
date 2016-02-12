using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Matching2.Models.DB;

namespace Matching2.Models
{
    public class CharacteristicModel 
    {

        public int ID { get; set; }
        public int UserID { get; set; }
        public string Height { get; set; }
        public string Weight { get; set; }
        public string Character { get; set; }
        public string Complexity { get; set; }




    }
}