import { FastifyReply, FastifyRequest } from 'fastify';

import { HealthService } from '../../application/index';

export class HealthController {
  constructor(private readonly healthService: HealthService) {}

  async check(_request: FastifyRequest, reply: FastifyReply): Promise<void> {
    const health = this.healthService.check();

    return reply.status(200).send(health);
  }
}
