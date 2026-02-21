using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Core.Models.Projects
{
    public class ProjectDto
    {
    }
    public class ResumeProjectDto
    {
        public int ProjectId { get; set; }
        public string Name { get; set; }
        public string ClienteName { get; set; }
        public string Status { get; set; }
        public int TotalTasks { get; set; }
        public int OpenTasks { get; set; }
        public int CompletedTask { get; set; }
    }
    public class ProjectTaskDto
    {
        public int ProjectId { get; set; }
        public string Name { get; set; }
        public string ClienteName { get; set; }
        public string Status { get; set; }
        public List<TaskDto.TaskDto> Tasks { get; set; }
    }

}
