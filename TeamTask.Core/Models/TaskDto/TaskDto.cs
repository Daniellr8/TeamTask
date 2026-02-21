using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace TeamTask.Core.Models.TaskDto
{
    public class TaskDto
    {
      //[TaskId]
      //,[ProjectId]
      //,[Title]
      //,[Description]
      //,[AssigneeId]
      //,[StatusId]
      //,[Priority]
      //,[EstimatedComplexity]
      //,[DueDate]
      //,[CompletionDate]
      //,[CreatedAt]
      public int TaskId { get; set; }
        public int ProjectId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public Guid AssigneeId { get; set; }
        public int StatusId { get; set; }
        public string Priority { get; set; }
            
        public int EstimatedComplexity { get; set; }
        public DateTime DueDate { get; set; }
        public DateTime? CompletionDate { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
