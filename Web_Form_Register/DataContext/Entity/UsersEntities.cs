using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Web;

namespace Web_Form_Register.DataContext.Entity
{
    [Table("Users")]
    public class UsersEntities
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long Id { get; set; }
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
        public string[] Interest { get; set; }
        public DateTime CreatedAt { get; set; }
    }

    public class CommonEnum
    {
        public enum AgeType
        { 
            Under13 = 1,
            OrOlder = 2
        }
        public enum JobType
        {
            [Description("Front-End Developer")]
            FrontEndDeveloper = 1,
            [Description("Back-End Developer")]
            BackEndDeveloper = 2
        }
        public enum InterestType
        {
            [Description("Developement")]
            Developement = 1,
            [Description("Design")]
            Design = 2,
            [Description("Business")]
            Business = 3
        }
    }
}