using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Matching.Startup))]
namespace Matching
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
