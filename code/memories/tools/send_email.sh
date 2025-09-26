#!/bin/bash

#===============================================================================
# 邮件发送脚本
#===============================================================================
#
# 功能: 通过 API 发送文本邮件到固定收件人
#
# 使用方法:
#   ./send_email.sh <主题> <内容>
#
# 使用示例:
#   ./send_email.sh "会议通知" "明天下午2点开会"
#   ./send_email.sh "项目更新" "项目已完成第一阶段"
#
# 注意:
#   - 收件人已固定为 6953405@163.com
#   - 需要网络连接
#   - 主题和内容都必须提供
#   - 如果参数包含空格，请用引号包围
#===============================================================================

API_KEY="app-m0DyZ6aWXqm49Ul4Tct0EQp4"
API_URL="https://10years.today:8080/v1/workflows/run"

# 固定收件人
recipient="6953405@163.com"

# 检查参数数量
if [[ $# -ne 2 ]]; then
    echo "使用方法: $0 <主题> <内容>"
    echo "示例: $0 \"会议通知\" \"明天下午2点开会\""
    echo "收件人: $recipient (固定)"
    exit 1
fi

# 获取参数
subject="$1"
content="$2"

# 发送邮件
echo "正在发送邮件..."
response=$(curl -s -X POST "$API_URL" \
    --header "Authorization: Bearer $API_KEY" \
    --header "Content-Type: application/json" \
    --data "{
        \"inputs\": {
            \"recipient\": \"$recipient\",
            \"subject\": \"$subject\",
            \"content\": \"$content\"
        },
        \"response_mode\": \"blocking\",
        \"user\": \"email-user-$(date +%s)\"
    }")

# 显示结果
if [[ $? -eq 0 ]]; then
    echo "发送成功!"
    echo "响应: $response"
else
    echo "发送失败，请检查网络连接"
    exit 1
fi