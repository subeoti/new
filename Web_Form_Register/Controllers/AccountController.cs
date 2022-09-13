using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;
using Web_Form_Register.DataContext;
using Web_Form_Register.DataContext.Entity;
using Web_Form_Register.Models;

namespace Web_Form_Register.Controllers
{
    public class AccountController : Controller
    {
        private readonly CoreContext coreContext;
        public AccountController()
        {
            this.coreContext = new CoreContext();
        }
        public ActionResult Register()
        {
            RegisterModels model = new RegisterModels();
            return View(model);
        }
        [HttpPost]
        public async Task<ActionResult> Register(RegisterModels model)
        {
            var usersEntities = new UsersEntities();
            usersEntities.FullName = model.FullName;
            usersEntities.Email = model.Email;
            usersEntities.Password = model.Password;
            usersEntities.Age = model.Age;
            usersEntities.Biography = model.Biography;
            usersEntities.Job = model.Job;
            List<string> _interest = new List<string>();
            if (model.Development)
            {
                _interest.Add("1");
            }
            if (model.Design)
            {
                _interest.Add("2");
            }
            if (model.Business)
            {
                _interest.Add("3");
            }
            usersEntities.Interest = _interest.ToArray();
            usersEntities.CreatedAt = DateTime.Now;
            coreContext.Users.Add(usersEntities);
            var result = await coreContext.SaveChangesAsync();
            if (result >= 1)
            {
                TempData["Successful"] = "Successfully added new account information";
                return RedirectToAction("Register");
            }
            else
            {
                TempData["IntervalServer"] = "Failed to add new account information";
            }
            return View(model);
        }
    }
}