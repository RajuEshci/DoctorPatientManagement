using Microsoft.AspNetCore.Mvc;

namespace DoctorPatientManagement.Controllers
{
    public class LoginController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
        public IActionResult Resetpassword()
        {
            return View();
        }
    }
}
