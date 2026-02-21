using Microsoft.AspNetCore.Mvc;
using TeamTask.Core.Interfaces;

namespace TeamTask.API.Controllers
{
    public class ProjectsController(IProjectsHandler projectsHandler) : ControllerBase
    {
        [HttpGet("projects")]
        public async Task<IActionResult> GetResumeProjects()
        {
            return Ok(await projectsHandler.GetResumeProjects());
        }

        [HttpGet("projects/{id}/tasks")]
        public async Task<IActionResult> GetProjectTasks(int id)
        {
            return Ok(await projectsHandler.GetProjectTasks(id));
        }   
    }
}
