import { FastifyInstance } from 'fastify';

import { HealthService } from '../../application/index';
import { HealthController } from './index';

export async function registerHealthRoutes(
  app: FastifyInstance,
): Promise<void> {
  const healthService = new HealthService();
  const healthController = new HealthController(healthService);

  app.get('/', healthController.check.bind(healthController));
}
