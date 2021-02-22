<template>
  <BaseModalForm ref="BaseForm_ref">
    <div class="h-dialog-content">
      <div class="h-dialog-header">
        <div class="h-dialog-header-title">Thông tin nhân viên</div>
        <div class="h-dialog-header-close">
          <button id="btnCancel" v-on:click="hide()"></button>
        </div>
      </div>
      <div class="h-dialog-content-body">
        <ModalValidata ref="ModalValidata_ref" :validate="validateBag" />
        <div class="form-group h-container-center">
          <p class="label-text text-one-line">
            Mã cửa hàng<span class="h-color-validate">&nbsp;*</span>
          </p>
          <input
            class="form-control w-lg"
            placeholder="Bắt buộc..."
            v-bind:class="{ 'is-valid-fail': !validate.shopCode }"
            tabindex="1"
            v-model="shop.shopCode"
          />
        </div>

        <div class="form-group h-container-center">
          <p class="label-text text-one-line">
            Tên cửa hàng<span class="h-color-validate">&nbsp;*</span>
          </p>
          <input
            class="form-control w-lg"
            placeholder="Bắt buộc"
            v-bind:class="{ 'is-valid-fail': !validate.shopName }"
            tabindex="2"
            v-model="shop.shopName"
          />
        </div>
        <div class="form-group h-container-center">
          <p class="label-text text-one-line">
            Địa chỉ<span class="h-color-validate">&nbsp;*</span>
          </p>
          <input
            class="form-control w-lg"
            placeholder="Bắt buộc"
            v-bind:class="{ 'is-valid-fail': !validate.address }"
            tabindex="3"
            v-model="shop.address"
          />
        </div>
        <div class="h-container">
          <div class="col-sm-6">
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Số điện thoại</p>
              <input
                class="form-control w-sm"
                tabindex="4"
                v-model="shop.phone"
              />
            </div>
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Quốc gian</p>
              <select
                class="form-control w-sm"
                tabindex="5"
                v-model="selectedCountry"
              >
                <option
                  v-for="option in optionCountry"
                  :key="option.value"
                  v-bind:value="option.value"
                >
                  {{ option.text }}
                </option>
              </select>
            </div>
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Tỉnh/Thành phố</p>
              <select
                class="form-control w-sm"
                tabindex="6"
                v-model="selectedCity"
              >
                <option
                  v-for="option in optionCity"
                  :key="option.value"
                  v-bind:value="option.value"
                >
                  {{ option.text }}
                </option>
              </select>
            </div>
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Phường/Xã</p>
              <select
                class="form-control w-sm"
                tabindex="7"
                v-model="shop.wardId"
              >
                <option
                  v-for="option in optionWard"
                  :key="option.value"
                  v-bind:value="option.value"
                >
                  {{ option.text }}
                </option>
              </select>
            </div>
          </div>
          <div class="col-sm-6 h-container-column p-column">
            <div class="form-group h-container-center">
              <p class="label-text text-one-line">Mã số thuế</p>
              <input
                class="form-control w-sm"
                tabindex="8"
                v-model="shop.taxCode"
              />
            </div>
            <div class="h-container-column h-container-end h-100">
              <div class="form-group h-container-center">
                <p class="label-text text-one-line">Quận/Huyện</p>
                <select
                  class="form-control w-sm"
                  tabindex="9"
                  v-model="selectedDistrict"
                >
                  <option
                    v-for="option in optionDistrict"
                    :key="option.value"
                    v-bind:value="option.value"
                  >
                    {{ option.text }}
                  </option>
                </select>
              </div>
              <div class="form-group h-container-center">
                <p class="label-text text-one-line">Đường phố</p>
                <input
                  class="form-control w-sm"
                  tabindex="10"
                  v-model="shop.street"
                />
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="h-dialog-footer h-container-row">
        <button class="h-btn h-btn-3" tabindex="14">
          <i class="h-icon h-icon-suppost"></i>
          <p>Trợ giúp</p>
        </button>
        <div class="ml-auto h-container-row">
          <button
            class="h-btn h-btn-1 mr-lg"
            id="btnSave"
            tabindex="11"
            v-on:click="Confirm(false)"
          >
            <i class="h-icon h-icon-save" aria-hidden="true"></i>
            <p>Lưu</p>
          </button>
          <button
            class="h-btn h-btn-2 mr-lg"
            id="btnSave"
            tabindex="12"
            v-on:click="Confirm(true)"
          >
            <i class="h-icon h-icon-saveAndAdd" aria-hidden="true"></i>
            <p>Lưu và thêm mới</p>
          </button>
          <button class="h-btn h-btn-3" id="btnCancel" @click="hide()">
            <i
              class="h-icon h-icon-cancel-active"
              aria-hidden="true"
              tabindex="13"
            ></i>
            <p>Hủy</p>
          </button>
        </div>
      </div>
    </div>
  </BaseModalForm>
</template>

<script>
import * as axios from "axios";
import * as vldShop from "./ValidateShop.js";
import BaseModalForm from "../BaseModalForm.vue";
import ModalValidata from "../ModalValidata.vue";
// //coordinates follow screen  ( pixel )
// const COORDINATES = {
//   shopCode: { left: "742px", top: "-6px" },
//   shopName: { left: "742px", top: "42px" },
//   address: { left: "742px", top: "90px" },
// };
// const TALK_VALIDATE = {
//   shopCode_Empty: "Mã cửa hàng không được bỏ trống",
//   shopCode_30maxLength: "Mã cửa hàng không quá 30 ký tự",
//   shopName_Empty: "Tên cửa hàng không được bỏ trống",
//   address_Empty: "Địa chỉ cửa hàng không được bỏ trống",
// };
export default {
  data() {
    return {
      // COORDINATES, // phải thêm nó mới hoạt động
      // TALK_VALIDATE,
      visible: false,
      shop: {
        shopCode: "",
        shopName: "",
        address: "",
        phone: "",
        taxCode: "",
        wardId: 0,
        statusId: null,
        street: "",
        createDate: null,
        createUserId: null,
      },
      selectedCountry: 0,
      optionCountry: [{ text: "--quốc gia--", value: 0 }],
      selectedCity: 0,
      optionCity: [{ text: "--tỉnh/thành phố--", value: 0 }],
      selectedDistrict: 0,
      optionDistrict: [{ text: "--quận/huyện--", value: 0 }],
      optionWard: [{ text: "--xã/phường--", value: 0 }],

      validateBag: {
        coordinates: vldShop.COORDINATES.shopCode,
        talk: "",
        success: true,
      },
      validate: {
        shopCode: false,
        shopName: false,
        address: false,
      },
    };
  },
  components: {
    BaseModalForm,
    ModalValidata,
  },
  methods: {
    //lấy danh sách quốc gia
    getCounTryData: async function () {
      const response = await axios.get(
        "https://localhost:44336/api/CounTry/BaseAll"
      );
      var optionCountry = [];
      optionCountry.push({ text: "--quốc gia--", value: 0 });
      response.data.data.forEach(function (item) {
        optionCountry.push({
          text: item.countryName,
          value: item.countryId,
        });
      });
      this.optionCountry = optionCountry;
    },
    // lấy danh sách thành phố theo quốc gia
    getCityData: async function () {
      const response = await axios.get("https://localhost:44336/api/City", {
        params: {
          countryId: this.selectedCountry,
        },
      });
      var optionCity = [];
      optionCity.push({ text: "--tỉnh/thành phố--", value: 0 });
      response.data.data.forEach(function (item) {
        optionCity.push({
          text: item.cityName,
          value: item.cityId,
        });
      });
      this.optionCity = optionCity;
    },
    // lấy danh sách quận/huyện theo tỉnh/thành phố
    getDistrictData: async function () {
      const response = await axios.get("https://localhost:44336/api/District", {
        params: {
          cityId: this.selectedCity,
        },
      });
      var optionDistrict = [];
      optionDistrict.push({ text: "--quận/huyện--", value: 0 });
      response.data.data.forEach(function (item) {
        optionDistrict.push({
          text: item.districtName,
          value: item.districtId,
        });
      });
      this.optionDistrict = optionDistrict;
    },

    // lấy danh sách xã/phường theo quận huyện
    getWardData: async function () {
      const response = await axios.get("https://localhost:44336/api/Ward", {
        params: {
          districtId: this.selectedDistrict,
        },
      });
      var optionWard = [];
      optionWard.push({ text: "--xã/phường--", value: 0 });
      response.data.data.forEach(function (item) {
        optionWard.push({
          text: item.wardName,
          value: item.wardId,
        });
      });
      this.optionWard = optionWard;
    },

    hide: async function () {
      this.$refs.BaseForm_ref.hide();
    },

    show: async function () {
      this.$refs.BaseForm_ref.show();
      await this.getCounTryData();
    },

    //hiện thông báo validate dữ liệu
    showValidate: async function () {
      this.$refs.ModalValidata_ref.show();
    },

    // ẩn thông báo validate dữ liệu
    hideValidate: async function () {
      this.$refs.ModalValidata_ref.hide();
    },

    // thực hiện chức năng thêm mới bản ghi
    // params: left - trạng thái có ở lại sau khi thêm mới thành công hay không
    Confirm: async function (leave) {
      var confirm;
      // lấy ra ngày giờ hiện tại
      var timeZoneffset = new Date().getTimezoneOffset() * 60000; //offset in milliseconds
      this.shop.createDate = new Date(Date.now() - timeZoneffset)
        .toISOString()
        .slice(0, -1);
      ///
      await axios
        .post("https://localhost:44336/api/Shop", this.shop)
        .then(function (res) {
          console.log("success: " + res.data);
          confirm = res.data;
          
        })
        .catch(function (err) {
          console.log("false: " + err);
          confirm = err.response.data;
        });     
      this.$emit("created", confirm, leave);
    },
    // reset dữ liệu trong form
    resetForm: function() {
      this.shop.shopCode = "";
      this.shop.shopName = "";
      this.shop.address = "";
      this.shop.phone = "";
      this.shop.taxCode = "";
      this.shop.wardId = 0;
      this.shop.street = "";

      this.selectedCountry = 0;
      this.selectedCity = 0;
      this.selectedDistrict = 0;
    },
  },

  watch: {
    "shop.shopCode": function () { 
      this.validateBag = vldShop.shopCode(this.shop.shopCode);
      if(this.validateBag.success == true){
        this.hideValidate();
        this.validate.shopCode = true;
      }
      else{
        this.showValidate();
        this.validate.shopCode = false;
      }
    },
    "shop.shopName": function () {
     this.validateBag = vldShop.shopName(this.shop.shopName);
      if(this.validateBag.success == true){
        this.hideValidate();
        this.validate.shopName = true;
      }
      else{
        this.showValidate();
        this.validate.shopName = false;
      }
    },
    "shop.address": function () {
      this.validateBag = vldShop.shopAddress(this.shop.address);
      if(this.validateBag.success == true){
        this.hideValidate();
        this.validate.address = true;
      }
      else{
        this.showValidate();
        this.validate.address = false;
      }
    },
    selectedCountry: async function () {
      await this.getCityData();
      this.selectedCity = 0;
    },
    selectedCity: async function () {
      await this.getDistrictData();
      this.selectedDistrict = 0;
    },
    selectedDistrict: async function () {
      await this.getWardData();
      this.shop.wardId = 0;
    },
  },
};
</script>
<style src="../modal.scss" lang="scss" />

<style scoped>
.h-dialog-content {
  height: fit-content;
  top: 0 !important;
  bottom: 0 !important;
  width: 800px;
}

.h-dialog-footer {
  background-color: #e5e5e5;
}
.form-control {
  height: 35px;
  margin-left: auto;
}

.w-lg {
  width: 620px;
  margin-left: auto;
}

.w-sm {
  width: 244px;
}
.h-100 {
  height: 100%;
}
.p-column {
  padding-left: 1.2rem;
}
</style>

