import { Component, inject, OnInit } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TabsModule } from 'primeng/tabs';
import { DividerModule } from 'primeng/divider';
import { PanelModule } from 'primeng/panel';
import { TableModule } from 'primeng/table';
import { InputTextModule } from 'primeng/inputtext';
import { TagModule } from 'primeng/tag';
import { forkJoin } from 'rxjs';

import { DashboardService } from '../../services/dashboard/dashboard.service';
import { DeveloperDelayRisk, DeveloperWorkload, ProjectHealth } from '../../interfaces/dashboard.interface';

import { FormatDatePipe } from '../../pipes/formatDatePipe';

@Component({
  selector: 'app-dashboard',
  standalone: true,
  imports: [
    CommonModule,
    TabsModule,
    TableModule,
    InputTextModule,
    DividerModule,
    PanelModule,
    TagModule,
    FormatDatePipe
  ],
  templateUrl: './dashboard.component.html'
})
export class DashboardComponent implements OnInit {

  private dashboardService = inject(DashboardService);

  projectHealth: ProjectHealth[] = [];
  developerWorkload: DeveloperWorkload[] = [];
  developerDelayRisk: DeveloperDelayRisk[] = [];

  loading = true;

  ngOnInit(): void {
    this.loadDashboardData();
  }

  private loadDashboardData(): void {
    forkJoin({
      projectHealth: this.dashboardService.getProjectHealth(),
      developerWorkload: this.dashboardService.getDeveloperWorkLoad(),
      developerDelayRisk: this.dashboardService.getDeveloperDelayRisks()
    }).subscribe({
      next: (result) => {
        this.projectHealth = result.projectHealth;
        this.developerWorkload = result.developerWorkload;
        this.developerDelayRisk = result.developerDelayRisk;
        this.loading = false;
      },
      error: (err) => {
        console.error('Dashboard load error:', err);
        this.loading = false;
      }
    });
  }
}