using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Interfaces;
using TeamTask.Core.Models.Dashboard;
using TeamTask.Infrastructure.Interfaces.DataAccess;
using TeamTask.Infrastructure.SqlStatement.Dashboard;

namespace TeamTask.Core.Handlers
{
    public class DashboardHandler(IDapperDataAccess dapperDataAccess): IDashboardHandler
    {
        public async Task<List<DeveloperWorkLoadDto>> GetDeveloperWorkload()
        {
            return await Task.FromResult(dapperDataAccess.GetAll<DeveloperWorkLoadDto>(sqlStatementDashboard.QueryGetDeveloperWorkload).ToList());
        }
        public async Task<List<ProjectHealthDashboardDto>> GetProjectHealthDashboardDto()
        {
            return await Task.FromResult(dapperDataAccess.GetAll<ProjectHealthDashboardDto>(sqlStatementDashboard.QueryGetProjectHealth).ToList());
        }
        public async Task<List<DelayRiskPredictionDto>> GetDeveloperDelayRisk()
            {
            return await Task.FromResult(dapperDataAccess.GetAll<DelayRiskPredictionDto>(sqlStatementDashboard.QueryGetDelayRiskPrediction).ToList());
        }
    }
}
