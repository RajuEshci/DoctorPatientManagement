using Microsoft.AspNetCore.Mvc;

namespace DoctorPatientManagement.Controllers
{
    public class RegisterController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
