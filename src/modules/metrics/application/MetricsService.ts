import client from 'prom-client';

const register = new client.Registry();

client.collectDefaultMetrics({ register });

export class MetricsService {
  async check(): Promise<string> {
    return await register.metrics();
  }
}
