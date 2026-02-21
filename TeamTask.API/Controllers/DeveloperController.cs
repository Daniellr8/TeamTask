using Microsoft.AspNetCore.Mvc;
using TeamTask.Core.Interfaces;

namespace TeamTask.API.Controllers
{
    public class DeveloperController(IDeveloperHandler developerHandler) : ControllerBase
    {
        [HttpGet("[action]")]
        public async Task<IActionResult> GetAllDevelopers()
        {
            return Ok(developerHandler.GetAllDevelopers());
        }
    }
}
