using DoctorPatientManagement.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace DoctorPatientManagement.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        public HomeController(ILogger<HomeController> logger)
        {
            _logger = logger;
        }

        public IActionResult Index(string type)
        {
            if (type == "Admin")
            {
                return View("AdminDashboard");
            }
            else if(type == "Doctor")
            {
                return View("doctorDashboard");
            }
            else
            {
                return View("PatientDashboard");
            }            
        }
        public IActionResult Doctor()
        {
            return View("DoctorList");
        }
        public IActionResult Patient()
        {
            return View("PatientList");
        }
        public IActionResult Diassess()
        {
            return View("DiassessList");
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
