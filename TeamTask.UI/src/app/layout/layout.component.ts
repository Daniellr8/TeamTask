import { Component } from '@angular/core';
import { RouterOutlet, Router } from '@angular/router';
import { MenubarModule } from 'primeng/menubar';
import { Card, CardModule } from 'primeng/card';
import { MenuItem } from 'primeng/api';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-layout',
  standalone: true,
  imports: [CommonModule, RouterOutlet, MenubarModule,CardModule],
  templateUrl: './layout.component.html'
})
export class LayoutComponent {

  items: MenuItem[];

  constructor(private router: Router) {
    this.items = [
      {
        label: 'Dashboard',
        icon: 'pi pi-home',
        command: () => this.router.navigate(['/dashboard'])
      },
      {
        label: 'Tareas por proyecto',
        icon: 'pi pi-briefcase',
        command: () => this.router.navigate(['/TasksByprojects'])
      },
      {
        label: 'Nueva tarea',
        icon: 'pi pi-users',
        command: () => this.router.navigate(['/NewTask'])
      }
    ];
  }
}