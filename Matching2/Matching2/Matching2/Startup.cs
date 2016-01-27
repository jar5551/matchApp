using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Matching2.Startup))]
namespace Matching2
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
