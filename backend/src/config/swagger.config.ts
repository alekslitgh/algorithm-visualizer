import { DocumentBuilder } from '@nestjs/swagger';

export const swaggerConfig = new DocumentBuilder()
  .setTitle('Algorithm Visualizer API')
  .setDescription('API for algorithm visualization')
  .setVersion('1.0')
  .addBearerAuth()
  .addServer('http://localhost:3000', 'dev')
  .build();
