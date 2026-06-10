import { describe, expect, it } from 'vitest';

import { AppFactory } from '../src/app';

describe('Health Endpoint', () => {
  it('should return status ok', async () => {
    const app = AppFactory.build();

    const response = await app.inject({
      method: 'GET',
      url: '/health',
    });

    expect(response.statusCode).toBe(200);

    expect(response.json()).toEqual({
      status: 'ok',
    });
  });
});
