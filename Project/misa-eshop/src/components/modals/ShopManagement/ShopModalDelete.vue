<template>
  <BaseModalForm ref="BaseForm_ref">
    <div class="h-dialog-content content-delete">
      <div class="h-dialog-header">
        <div class="h-dialog-header-title">Xóa dữ liệu</div>
        <div class="h-dialog-header-close">
          <button id="btnCancel" v-on:click="hide()"></button>
        </div>
      </div>
      <div class="h-container-center mt-1 mb-1">
        <i class="fas fa-question-circle fa-2x"></i>
        <div class="text-notify h-container-column">
          <p>Cảnh báo có {{ listId.length }} cửa hàng được chọn !</p>
          <p>Bạn có chắc muốn cửa hàng ?</p>
        </div>
      </div>
      <div class="h-dialog-footer h-container">
        <div class="ml-auto h-container-row">
          <button class="h-btn h-btn-1 mr-lg h-delete-btn" @click="Confirm()">
            <i class="h-icon h-icon-delete" aria-hidden="true"></i>
            <p>Xóa</p>
          </button>
          <button class="h-btn h-btn-3" id="btnCancel" @click="hide()">
            <i class="h-icon h-icon-cancel-active" aria-hidden="true"></i>
            <p>Hủy bỏ</p>
          </button>
        </div>
      </div>
    </div>
  </BaseModalForm>
</template>

<script>
import * as axios from "axios";
import BaseModalForm from "../BaseModalForm.vue";

export default {
  props: {
    listId: Array,
  },
  data() {
    return {
      // conpletedDelete: false, // không nên gọi $emit sau foreach, tạo 1 biết theo dõi foreach kết thúc rồi gọi $emit
      // notices: [], // thông báo kết thúc trả về ShopManagement
    };
  },
  components: {
    BaseModalForm,
  },
  methods: {
    hide: async function () {
      await this.$refs.BaseForm_ref.hide();
    },
    show: async function () {
      await this.$refs.BaseForm_ref.show();
    },
    Confirm: async function () {
      var listReponse=[];
      // var totalId = this.listId.length;
      // var count =0;     
      for (var item in this.listId) {
        await axios
          .delete("https://localhost:44336/api/Shop/" + item)
          .then(function (res) {
            console.log("success: " + res);
            listReponse.push({ id: item, status: true });
          })
          .catch(function (err) {
            
            listReponse.push({ id: item, status: false });
            console.log("false: " + err);
          });
      }       
          
          this.$emit("deleted", listReponse);
      
    },

   
  },
  //  watch: {
  //     conpletedDelete: function () {
  //       if (this.conpletedDelete == true) {
  //         console.log("emit delete");
  //         console.log(this.notices);
  //         this.$emit("deleted", this.notices);
  //       }
  //     },
  //   },
};
</script>

<style src="../modal.scss" lang="scss" />
<style scoped>
.h-dialog-content {
  width: 400px;
}
.fa-question-circle {
  color: #00557b;
  margin: 20px;
}

.text-notify {
  width: 80%;
  left: 10px;
}
.h-dialog-footer {
  background-color: #ffffff;
}
</style>