using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.HttpsPolicy;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using MyApartment.Data.Repository;
using MyApartment.Data.Services;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;

namespace MyApartment.WebClient
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            //services.AddSingleton<IMyApartmentExpenseDataProvider, InMememoryExpenseDataProvider>();
            services.AddScoped<IMyApartmentExpenseDataProvider, MyApartmentExpenseDataProvider>();
            services.AddDbContextPool<MyApartmentDbContext>
                (options => options.UseSqlServer(Configuration.GetConnectionString("DockerSVLakeview")));
            services.AddRazorPages();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();
            app.UseNodeModules();
            app.UseRouting();

            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapRazorPages();
                endpoints.MapControllers(); //Routes for my API controllers
            });

            app.Use(MyOwnMiddleWare);


        }

        private RequestDelegate MyOwnMiddleWare(RequestDelegate next)
        {
            return async ctx =>
            {
                if (ctx.Request.Path.StartsWithSegments("/hello"))
                {
                    await ctx.Response.WriteAsync("Hello World");
                }
                else
                {
                    await next(ctx);
                }
            };
        }
    }
}
