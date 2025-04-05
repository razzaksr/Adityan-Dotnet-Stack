using Microsoft.AspNetCore.Mvc;
using Models;

namespace Controllers{
    // declaring this class acting as controller/ api
    [ApiController]
    [Route("api/poc")]
    public class PocController:ControllerBase{
        // Data logic >> Collection
        private static List<POC> scheduledPoc = new(){
            new POC{Name="Shankar",Role="Assistant Professor",Contact=876545674,Email="shankar@gmail.com"},
            new POC{Name="Nagaraj",Role="Associate Professor",Contact=654567656,Email="nagaraj@gmail.com"},
            new POC{Name="Vinayak",Role="Professor",Contact=7654567834,Email="vinayak@gmail.com"},
            new POC{Name="Prakash",Role="Assistant Professor",Contact=3456765434,Email="prakash@gmail.com"},
        };

        // routings >> http methods: get,post,put,delete

        // read all poc's
        // 
        // public ActionResult<IEnumerable<POC>> ReadAll(){
        //     return scheduledPoc;
        // }

        // lambda
        [HttpGet]
        public ActionResult<IEnumerable<POC>> ReadAll()=> scheduledPoc;

        // request body >> POC
        [HttpPost]
        public IActionResult CreateOne(POC poc){
            if(!ModelState.IsValid)
                return BadRequest(ModelState);
            scheduledPoc.Add(poc);
            // return CreatedAtAction(nameof(ReadAll),poc);
            return Ok(poc);
        }

        // request param>> Email
        // [HttpPut("{Email}")]
        // public ActionResult UpdateOne(String Email, POC poc){
        //     var found = scheduledPoc.FirstOrDefault(point => point.Email.Equals(Email));
        //     if(found is null)
        //         return NotFound();
        //     found.Name = poc.Name;
        //     found.Contact = poc.Contact;
        //     found.Role = poc.Role;
        //     return NoContent();
        // }
        [HttpPut]
        public ActionResult UpdateOne(POC poc){
            var found = scheduledPoc.FirstOrDefault(point => point.Email.Equals(poc.Email));
            if(found is null)
                return NotFound();
            found.Name = poc.Name;
            found.Contact = poc.Contact;
            found.Role = poc.Role;
            return NoContent();
        }

        [HttpDelete("{Email}")]
        public ActionResult<String> Deletion(String Email){
            var found = scheduledPoc.FirstOrDefault(point => point.Email.Equals(Email));
            String returns = found.Name;
            if(found is null)
                return NotFound();
            scheduledPoc.Remove(found);
            return returns+" has been deleted ";
        }
    }
}