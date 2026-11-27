import DM from './NativeDetectMaestroModule';

export const DetectMaestro = {
    isMaestro: (): boolean => DM.isMaestro(),
} as const;
