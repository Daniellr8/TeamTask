using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Core.Models.Dashboard
{
    public class DashboardDto
    {
    }
    public class DeveloperWorkLoadDto
    {
        public string DeveloperName { get; set; }
        public int OpentaskCount { get; set; }
        public decimal AvgEstimatedComplexity { get; set; }
    }
    public class ProjectHealthDashboardDto
    {
        public string ProjectName { get; set; }
        public int OpenTasks { get; set; }
        public int CompletedTasks { get; set; }
    }
    public class DelayRiskPredictionDto
    {
        public Guid DeveloperId { get; set; }
        public string DeveloperName { get; set; }
        public int OpenTasksCount { get; set; }
        public decimal AverageDelayDays { get; set; }            
        public DateTime NearestDueDate { get; set; }
        public DateTime LatestDueDate { get; set; }
        public DateTime PredictedCompletionDate { get; set; }
        public bool HighRiskFlag { get; set; }
    }
}
