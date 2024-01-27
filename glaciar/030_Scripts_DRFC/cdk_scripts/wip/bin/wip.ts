#!/usr/bin/env node
import * as cdk from 'aws-cdk-lib';
import { WipStack } from '../lib/wip-stack';

const app = new cdk.App();
new WipStack(app, 'WipStack');
