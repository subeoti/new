using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Web_Form_Register.DataContext.Entity;

namespace Web_Form_Register.Models
{
    public class RegisterModels
    {
        [Required]
        public string FullName { get; set; }
        [Required]
        [MaxLength(250)]
        public string Email { get; set; }
        [Required]
        [MaxLength(250)]
        public string Password { get; set; }
        public CommonEnum.AgeType Age { get; set; }
        public string Biography { get; set; }
        public CommonEnum.JobType Job { get; set; }
        public bool Development { get; set; }
        public bool Design { get; set; }
        public bool Business { get; set; }
    }
}