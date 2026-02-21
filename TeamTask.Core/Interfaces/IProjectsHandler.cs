using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Models.Projects;

namespace TeamTask.Core.Interfaces
{
    public interface IProjectsHandler
    {
        Task<List<ResumeProjectDto>> GetResumeProjects();
        Task<List<ProjectTaskDto>> GetProjectTasks(int projectId);
    }
}
