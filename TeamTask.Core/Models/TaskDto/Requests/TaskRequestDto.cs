using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations;

namespace TeamTask.Core.Models.TaskDto.Requests
{
    public class TaskRequestDto
    {
        [Range(1, int.MaxValue, ErrorMessage = "ProjectId debe ser un identificador válido.")]
        public int ProjectId { get; set; }
        [Required(ErrorMessage = "El título es obligatorio.")]
        public string Title { get; set; } = string.Empty;

        [Required(ErrorMessage = "La descripción es obligatoria.")]
        public string Description { get; set; } = string.Empty;

        [Required(ErrorMessage = "El id desarrollador asignado es obligatorio.")]
        public Guid @AssigneeId { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "StatusId debe ser un identificador válido.")]
        public int StatusId { get; set; }


        [Required( ErrorMessage = "La complejidad es obligatoria")]
        public string Priority { get; set; }

        [Range(1, int.MaxValue, ErrorMessage = "Complexity debe ser un identificador válido.")]
        public int EstimatedComplexity { get; set; }

        [Required(ErrorMessage = "La fecha estimada de finalizacion es requerida")]
        public DateTime DueDate { get; set; }

        public DateTime @CreatedAt { get; set; } = DateTime.UtcNow;
    }

    public class UpdateStatusTaskRequestDto
    {
        [Range(1, int.MaxValue, ErrorMessage = "StatusId debe ser un identificador válido.")]
        public int StatusId { get; set; }
    }
}
