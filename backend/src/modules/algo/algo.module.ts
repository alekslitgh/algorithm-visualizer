import { Module } from '@nestjs/common';
import { AlgoService } from './algo.service';
import { AlgoController } from './algo.controller';

@Module({
  providers: [AlgoService],
  controllers: [AlgoController]
})
export class AlgoModule {}
