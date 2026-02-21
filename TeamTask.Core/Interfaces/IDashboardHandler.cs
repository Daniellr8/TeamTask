using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TeamTask.Core.Models.Dashboard;

namespace TeamTask.Core.Interfaces
{
    public interface IDashboardHandler
    {
            Task<List<DeveloperWorkLoadDto>> GetDeveloperWorkload();
            Task<List<ProjectHealthDashboardDto>> GetProjectHealthDashboardDto();
            Task<List<DelayRiskPredictionDto>> GetDeveloperDelayRisk();
    }
}
