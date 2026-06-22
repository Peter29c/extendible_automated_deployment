import { FastifyInstance } from 'fastify';

export const healthRoutes = async (app: FastifyInstance) => {
  app.get('/health', async (_request, _reply) => {
    return {
      status: 'ok',
      version: '1.0.0',
      timestamp: new Date(),
    };
  });
};
