using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Interfaces;
using TeamTask.Core.Models.Projects;
using TeamTask.Infrastructure.Interfaces.DataAccess;
using TeamTask.Infrastructure.SqlStatement.Projects;

namespace TeamTask.Core.Handlers
{
    public  class ProjectsHandler(IDapperDataAccess dapperDataAccess) : IProjectsHandler
    {
       
        public async Task<List<ResumeProjectDto>> GetResumeProjects()
        {
           return await Task.FromResult(dapperDataAccess.GetAll<ResumeProjectDto>(sqlStatementProjects.QueryGetResumeProjects).ToList());  
        }
        public async Task<List<ProjectTaskDto>> GetProjectTasks(int projectId)
        {
            return await dapperDataAccess.GetAllAsync<ProjectTaskDto>(sqlStatementProjects.QueryGetProjectTasks, projectId);
        }
    }
}
