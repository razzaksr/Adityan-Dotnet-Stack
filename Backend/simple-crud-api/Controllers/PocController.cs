using Data;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Models;

namespace Controllers{
    // declaring this class acting as controller/ api
    [ApiController]
    [Route("api/poc")]
    public class PocController:ControllerBase{
        private readonly PocDbContext _context;
        public PocController(PocDbContext pocDbContext){
            _context=pocDbContext;
        }
        // Data logic >> Collection
        // private static List<POC> scheduledPoc = new(){
        //     new POC{Name="Shankar",Role="Assistant Professor",Contact=876545674,Email="shankar@gmail.com"},
        //     new POC{Name="Nagaraj",Role="Associate Professor",Contact=654567656,Email="nagaraj@gmail.com"},
        //     new POC{Name="Vinayak",Role="Professor",Contact=7654567834,Email="vinayak@gmail.com"},
        //     new POC{Name="Prakash",Role="Assistant Professor",Contact=3456765434,Email="prakash@gmail.com"},
        // };

        // routings >> http methods: get,post,put,delete

        // read all poc's
        // 
        // public ActionResult<IEnumerable<POC>> ReadAll(){
        //     return scheduledPoc;
        // }

        // lambda
        [HttpGet]
        public async Task<ActionResult<IEnumerable<POC>>> ReadAll()
        {
            return await _context.Pocs.ToListAsync();
        }

        // public ActionResult<IEnumerable<POC>> ReadAll()=> scheduledPoc;

        // request body >> POC
        [HttpPost]
        public async Task<ActionResult<POC>> CreateOne(POC poc){
            if(!ModelState.IsValid)
                return BadRequest(ModelState);
            _context.Pocs.Add(poc);
            await _context.SaveChangesAsync();
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
        public async Task<ActionResult> UpdateOne(POC poc){
            var found = await _context.Pocs.FindAsync(poc.Id);
            // var found = scheduledPoc.FirstOrDefault(point => point.Email.Equals(poc.Email));
            if(found is null)
                return NotFound();
            found.Name = poc.Name;
            found.Contact = poc.Contact;
            found.Role = poc.Role;
            found.Email=poc.Email;
            await _context.SaveChangesAsync();
            return NoContent();
        }

        [HttpDelete("{Email}")]
        public async Task<ActionResult<String>> Deletion(String Email){
            // var found = scheduledPoc.FirstOrDefault(point => point.Email.Equals(Email));
            var found = await _context.Pocs.FirstOrDefaultAsync(point => point.Email.Equals(Email));
            if(found is null)
                return NotFound();
            // scheduledPoc.Remove(found);
            String returns = found.Name;
            _context.Pocs.Remove(found);
            await _context.SaveChangesAsync();
            return returns+" has been deleted ";
        }
    }
}