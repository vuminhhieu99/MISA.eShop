<template>
  <transition name="component-fade" mode="out-in">
    <div
      class="talk-bubble"
      v-bind:class="validate.success ? 'h-success' : 'h-fail'"
      v-bind:style="{
        left: validate.coordinates.left,
       top: validate.coordinates.top
      }"
      v-show="visible"
    >
      <div class="talktext">
        <p>
          {{ validate.talk }}
        </p>
      </div>
    </div>
  </transition>
</template>

<script>
export default {
  props: {
    validate: Object,
  },
  data() {
    return {
      visible: false,
      debounce: null
    };
  },

  methods: {
    hide: async function () {
      this.visible = false;
    },
    show: async function () {
      this.visible = true;
      console.log("show call");
       clearTimeout(this.debounce);
      this.debounce = setTimeout(() =>  {
         setTimeout(
        function () {
          console.log("show 5s");
          this.visible = false;
        }.bind(this),
        5000
      );
      }, 2000);
      
    }
  }
};
</script>

<style src="./modal.scss" lang="scss" />
<style scoped>
.talk-bubble {
  display: inline-block;
  position: absolute;
  width: 200px;
  height: auto;
  min-height: 40px;
  border-radius: 4px;
  background-color: red;
  color: #ffffff;
  box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2), 5px 5px 20px rgba(0, 0, 0, 0.18) !important;  
  z-index: 99999;
}

.talk-bubble:after {
  content: " ";
  position: absolute;
  width: 0;
  height: 0;
  left: -26px;
  right: auto;
  top: 4px;
  bottom: auto;
  border: 16px solid;
  border-color: transparent red transparent transparent;
}

.talktext {
  padding: 0.6em;
}

.component-fade-enter-active {
  animation: bounce-in 0.5s;
}
.component-fade-leave-active {
  animation: bounce-out 0.5s;
}
@keyframes bounce-in {
  0% {
    opacity: 0;
  }

  100% {
    opacity: 1;
  }
}
@keyframes bounce-out {
  100% {
    opacity: 0;
  }
}
</style>