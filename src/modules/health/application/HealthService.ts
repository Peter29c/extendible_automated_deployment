export interface HealthStatus {
  status: string;
  version: string;
  timestamp: string;
}

export class HealthService {
  check(): HealthStatus {
    return {
      status: 'ok',
      version: '1.0.0',
      timestamp: new Date().toISOString(),
      /* TODO: add properties
      database: 'up',
      redis: 'up',
      */
    };
  }
}
