using Microsoft.AspNetCore.Mvc;
using TeamTask.Core.Interfaces;

namespace TeamTask.API.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DashboardController(IDashboardHandler dashboardHandler) : ControllerBase
    {
        [HttpGet("developer-workload")]
        public async Task<IActionResult> GetDeveloperWorkload()
        {
            return Ok(await dashboardHandler.GetDeveloperWorkload());
        }

        [HttpGet("project-health")]
        public async Task<IActionResult> GetProjectHealth()
        {
            return Ok(await dashboardHandler.GetProjectHealthDashboardDto());
        }
        [HttpGet("developer-delay-risk")]
        public async Task<IActionResult> GetDeveloperDelayRisk()
        {
            return Ok(await dashboardHandler.GetDeveloperDelayRisk());
        }
    }
}
