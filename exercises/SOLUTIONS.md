# Đáp Án Bài Tập

File này tóm tắt các phần cần hoàn thành trong `exercises/`.

## Exercise 2: Tools và Knowledge Base

Đáp án nằm trong `exercise_2_tools.py`.

Các thay đổi chính:

1. Thêm entry `labor_law` vào `LEGAL_KNOWLEDGE` với các keyword:

```python
["lao động", "sa thải", "hợp đồng lao động", "labor", "termination"]
```

2. Tạo tool `check_statute_of_limitations(case_type: str)` để trả về thời hiệu theo loại vụ án:

```python
limits = {
    "contract": "4 năm (UCC § 2-725)",
    "tort": "2-3 năm tùy bang",
    "property": "5 năm",
}
```

3. Thêm tool mới vào danh sách tools:

```python
tools = [search_legal_knowledge, check_statute_of_limitations]
```

Kiểm tra nhanh:

```bash
uv run python exercises/exercise_2_tools.py
```

Kết quả đúng khi chương trình gọi được tool tra cứu knowledge base hoặc tool thời hiệu, sau đó tổng hợp câu trả lời cuối cùng.

## Exercise 4: Multi-Agent với Privacy Agent

Đáp án nằm trong `exercise_4_multiagent.py`.

Các thay đổi chính:

1. Thêm field vào state:

```python
privacy_analysis: Annotated[str, _last_wins]
```

2. Implement `privacy_agent(state)` để phân tích GDPR, data protection, privacy rights, data breach và nghĩa vụ thông báo.

3. Thêm conditional routing cho các keyword:

```python
["data", "privacy", "gdpr", "dữ liệu", "rò rỉ"]
```

4. Thêm node và edge vào graph:

```python
graph.add_node("privacy_agent", privacy_agent)
graph.add_edge("privacy_agent", "aggregate_results")
```

5. Cập nhật `aggregate_results()` để đưa `privacy_analysis` vào báo cáo cuối cùng.

Kiểm tra nhanh:

```bash
uv run python exercises/exercise_4_multiagent.py
```

Kết quả đúng khi câu hỏi về data breach kích hoạt `privacy_agent` và báo cáo cuối cùng có phần phân tích bảo vệ dữ liệu.
