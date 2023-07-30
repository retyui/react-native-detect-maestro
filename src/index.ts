import DM from './NativeDetectMaestroModule';

export const DetectMaestro = {
    // Cast `1` & `0` on iOS (old arch)
    isMaestro: (): boolean => Boolean(DM.isMaestro()),
} as const;
