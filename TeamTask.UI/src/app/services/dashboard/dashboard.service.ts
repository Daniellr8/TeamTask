import { HttpClient } from '@angular/common/http';
import { inject, Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from '../../../enviroments/enviroments';
import { DeveloperDelayRisk, DeveloperWorkload, ProjectHealth } from '../../interfaces/dashboard.interface';

@Injectable({
    providedIn: 'root'
})
export class DashboardService {
    private http = inject(HttpClient);
    private baseUrl = `${environment.localVariables.localApiUrl}/dashboard`;
    
        getProjectHealth(): Observable<ProjectHealth[]> {
           
            return this.http.get<ProjectHealth[]>(`${this.baseUrl}/project-health`);
        }
          getDeveloperWorkLoad(): Observable<DeveloperWorkload[]> {
            return this.http.get<DeveloperWorkload[]>(`${this.baseUrl}/developer-workload`);
        }
          getDeveloperDelayRisks(): Observable<DeveloperDelayRisk[]> {
            return this.http.get<DeveloperDelayRisk[]>(`${this.baseUrl}/developer-delay-risk`);
        }
    
        
    
        
}