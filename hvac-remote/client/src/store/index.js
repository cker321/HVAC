import { createStore } from 'vuex'
import deviceModule from './modules/device'
import airModule from './modules/air'
import windModule from './modules/wind'

export default createStore({
  state: {
    loading: false,
    error: null
  },
  getters: {
    isLoading: state => state.loading,
    hasError: state => state.error !== null,
    errorMessage: state => state.error
  },
  mutations: {
    SET_LOADING(state, status) {
      state.loading = status;
    },
    SET_ERROR(state, error) {
      state.error = error;
    },
    CLEAR_ERROR(state) {
      state.error = null;
    }
  },
  actions: {
    setLoading({ commit }, status) {
      commit('SET_LOADING', status);
    },
    setError({ commit }, error) {
      commit('SET_ERROR', error);
    },
    clearError({ commit }) {
      commit('CLEAR_ERROR');
    }
  },
  modules: {
    device: deviceModule,
    air: airModule,
    wind: windModule
  }
})
