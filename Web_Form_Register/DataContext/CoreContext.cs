using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.ModelConfiguration;
using System.Linq;
using System.Reflection;
using System.Web;
using Web_Form_Register.DataContext.Entity;

namespace Web_Form_Register.DataContext
{
    public class CoreContext : DbContext
    {
        public CoreContext() : base("name=Core_Context")
        {
            ((IObjectContextAdapter)this).ObjectContext.ContextOptions.LazyLoadingEnabled = true;
        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            var typesToRegister = Assembly.GetExecutingAssembly().GetTypes()
                                            .Where(type => !String.IsNullOrEmpty(type.Namespace))
                                            .Where(type => type.BaseType != null && type.BaseType.IsGenericType &&
                                            type.BaseType.GetGenericTypeDefinition() == typeof(EntityTypeConfiguration<>));
            foreach (var type in typesToRegister)
            {
                dynamic configurationInstance = Activator.CreateInstance(type);
                modelBuilder.Configurations.Add(configurationInstance);
            }

            base.OnModelCreating(modelBuilder);
        }

        public virtual DbSet<UsersEntities> Users { get; set; }
    }
}