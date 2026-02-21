
import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class ProjectsService {

  private apiUrl = 'http://localhost:7102/Api/Dashboard/developer-workload';

  constructor(private http: HttpClient) { }

  getAllDevelopers(): Observable<any> {
    return this.http.get(this.apiUrl);
  }

}
