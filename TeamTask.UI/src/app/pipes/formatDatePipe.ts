import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'formatDate',
  standalone: true
})
export class FormatDatePipe implements PipeTransform {

  transform(value: string | Date | null | undefined, format: 'short' | 'long' = 'short'): string {
    if (!value) return '';

    const date = new Date(value);

    if (isNaN(date.getTime())) return '';

    if (format === 'long') {
      return date.toLocaleDateString('es-ES', {
        day: '2-digit',
        month: 'long',
        year: 'numeric'
      });
    }

    // default short format
    return date.toLocaleDateString('es-ES');
  }
}