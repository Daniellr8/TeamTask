export interface ProjectHealth {
    projectName: string;
    openTasks: number;
    completedTasks: number;
    
}

export interface DeveloperWorkload {
    developerName: string;
    opentaskCount: number;
    avgEstimatedComplexity: number;
}
export interface DeveloperDelayRisk {
    developerId: string;
    developerName: string;
    openTasksCount: number;
    averageDelayDays: number;
    nearestDueDate: string;
    latestDueDate: string;
    predictedCompletionDate: string;
    highRiskFlag: boolean;
}
