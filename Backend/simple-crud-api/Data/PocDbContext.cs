using Microsoft.EntityFrameworkCore;
using Models;

namespace Data{
    public class PocDbContext:DbContext{
        public PocDbContext(DbContextOptions<PocDbContext> options):base(options){}

        public DbSet<POC> Pocs{set;get;}
    }
}