import { http } from './config';

export default {
    getOrphanage:() => {
        return http.get(`orphanage/1`)
    }
}