using System.ComponentModel.DataAnnotations;

namespace Models
{
    // point of contact
    public class POC{
        public int Id{set;get;}
        [Required(ErrorMessage = "POC Name must be mentioned")]
        [StringLength(50,MinimumLength = 2, ErrorMessage = "POC Name's character length must be in range between 2 to 50")]
        public String Name{get;set;}
        [Required(ErrorMessage = "Role Must be mentioned")]
        [StringLength(50)]
        public String Role{get;set;}
        [Required(ErrorMessage = "Contact must be mentioned")]
        [Range(1000000000,9999999999,ErrorMessage = "Invalid Contact Range")]
        public long Contact{get;set;}
        [Required(ErrorMessage = "Email must be mentioned")]
        [EmailAddress(ErrorMessage = "Invalid Email")]
        public String Email{get;set;}
    }
}