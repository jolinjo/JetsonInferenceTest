# imagenet_jason.py 更新歷程與版本控制

## 檔案說明
此檔案是基於 `imagenet.py` 的修改版本，專門為 Jason 客製化。

## 版本歷程

### v1.0.0 - 2024-11-23
**初始版本**
- 基於原始 `imagenet.py` 檔案複製
- **主要修改**：預設輸入相機改為 `csi://0`
  - 原本預設值：`default=""`
  - 修改後：`default="csi://0"`
  - 位置：第 36 行的 `parser.add_argument("input", ...)`

**功能特點**
- 使用 CSI 相機 0 作為預設輸入源
- 保持其他功能與原始 `imagenet.py` 完全一致
- 支援命令列參數覆蓋預設值

**使用方式**
```bash
# 使用預設 CSI 相機 0
python3 imagenet_jason.py

# 指定其他輸入源（覆蓋預設值）
python3 imagenet_jason.py /dev/video0
python3 imagenet_jason.py rtsp://...
```

**技術細節**
- 腳本位於：`build/aarch64/bin/imagenet_jason.py`
- 與原始 `imagenet.py` 的唯一差異在於預設輸入參數
- 所有其他功能（網路選擇、輸出、topK 等）保持不變

## 修改說明

### 為什麼要修改預設值？
原始的 `imagenet.py` 預設輸入為空字串，需要手動指定輸入源。修改為 `csi://0` 後，可以在不指定參數的情況下直接使用 CSI 相機。

### 如何恢復原始行為？
如果需要恢復原始行為（預設為空字串），只需將第 36 行改為：
```python
parser.add_argument("input", type=str, default="", nargs='?', help="URI of the input stream")
```

## 維護記錄

| 日期 | 版本 | 修改者 | 說明 |
|------|------|--------|------|
| 2024-11-23 | v1.0.0 | - | 初始版本，修改預設相機輸入為 csi://0 |

## 注意事項
- 此檔案僅適用於支援 CSI 相機的 Jetson 設備
- 如果設備上沒有 CSI 相機，需要手動指定其他輸入源
- 在 Docker 容器中使用時，確保相機設備已正確掛載
